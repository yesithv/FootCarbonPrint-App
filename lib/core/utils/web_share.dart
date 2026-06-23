// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;
// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:js' as js;
// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:js_util' as js_util;
import 'dart:typed_data';

/// True when the browser exposes navigator.share.
bool get webShareAvailable {
  try {
    final nav = js.context['navigator'];
    if (nav == null) return false;
    return (nav as js.JsObject).hasProperty('share');
  } catch (_) {
    return false;
  }
}

/// Share text + URL via the Web Share API.
/// Returns true on success, false if cancelled or unsupported.
Future<bool> shareText({
  required String title,
  required String text,
  required String url,
}) async {
  try {
    final nav = js.context['navigator'] as js.JsObject;
    final data = js.JsObject.jsify({'title': title, 'text': text, 'url': url});
    await js_util.promiseToFuture<void>(nav.callMethod('share', [data]));
    return true;
  } catch (_) {
    return false;
  }
}

/// Share an image file via the Web Share API.
/// Falls back gracefully — returns false if the API or file sharing is
/// not supported, so the caller can open a blob URL as fallback.
Future<bool> shareImage(
  Uint8List bytes,
  String filename, {
  String title = 'FootCarbonPrint',
}) async {
  try {
    final jsNav = js.JsObject.fromBrowserObject(html.window.navigator);
    if (!jsNav.hasProperty('share')) return false;

    // Wrap the native Blob in a JS File.
    final blob = html.Blob([bytes], 'image/png');
    final jsBlob = js.JsObject.fromBrowserObject(blob);
    final fileOptions = js.JsObject(js.context['Object'] as js.JsFunction);
    fileOptions['type'] = 'image/png';
    final jsFile = js.JsObject(
      js.context['File'] as js.JsFunction,
      [js.JsArray.from([jsBlob]), filename, fileOptions],
    );

    // Build the share payload.
    final filesArray = js.JsArray.from([jsFile]);
    final shareData = js.JsObject(js.context['Object'] as js.JsFunction);
    shareData['title'] = title;
    shareData['files'] = filesArray;

    // canShare check (optional — not all browsers implement it).
    if (jsNav.hasProperty('canShare') &&
        jsNav.callMethod('canShare', [shareData]) != true) {
      return false;
    }

    await js_util.promiseToFuture<void>(jsNav.callMethod('share', [shareData]));
    return true;
  } catch (_) {
    return false;
  }
}
