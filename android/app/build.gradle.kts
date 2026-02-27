plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    // Firebase: reads google-services.json and injects Firebase config at build time
    id("com.google.gms.google-services")
}

android {
    namespace = "com.autotanki.androidapp"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.autotanki.androidapp"
        minSdk = flutter.minSdkVersion           // Flutter minimum; API 30 well above this
        targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // ─── Per-ABI APK splits ────────────────────────────────────────────────
    // Produces separate APKs for each CPU architecture.
    // The arm64-v8a APK is ~30MB instead of 84MB — installs reliably.
    splits {
        abi {
            isEnable = true
            reset()
            include("arm64-v8a", "armeabi-v7a", "x86_64")
            isUniversalApk = true  // also keep the fat APK as fallback
        }
    }

    buildTypes {
        release {
            // Signing with debug keys for now — replace with release keystore for production.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
