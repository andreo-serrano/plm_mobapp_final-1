// Generated file.
//
// If you wish to remove Flutter's multidex support, delete this entire file.
//
// Modifications to this file should be done in a copy under a different name
// as this file may be regenerated.

package io.flutter.app;

import androidx.multidex.MultiDexApplication;
import androidx.multidex.MultiDex;
/**
 * Extension of {@link android.app.Application}, adding multidex support.
 */
public class FlutterMultiDexApplication extends MultiDexApplication {
  @Override
  public void onCreate() {
      super.onCreate();
      MultiDex.install(this);
  }
}
