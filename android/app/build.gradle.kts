import com.android.build.gradle.internal.cxx.configure.gradleLocalProperties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val flutterRoot = gradleLocalProperties(rootDir).getProperty("flutter.sdk")
val flutterVersionCode = 1
val flutterVersionName = "1.0"

android {
    compileSdk = 34
    ndkVersion = "27.0.12077973" // ✅ Fix for NDK conflict

    namespace = "com.example.yourapp"

    defaultConfig {
        applicationId = "com.example.yourapp"
        minSdk = 21
        targetSdk = 34
        versionCode = flutterVersionCode
        versionName = flutterVersionName
        multiDexEnabled = true
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}

dependencies {
    implementation("androidx.multidex:multidex:2.0.1")
}

// Flutter setup
apply {
    from("$flutterRoot/packages/flutter_tools/gradle/flutter.gradle")
}
