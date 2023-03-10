default: gen lint

gen:
    flutter pub get
    flutter_rust_bridge_codegen \
        --rust-input native/src/api.rs \
        --dart-output lib/bridge_generated.dart \
        --c-output macos/Runner/bridge_generated.h \
        --extra-c-output-path ios/Runner/ \
        --dart-decl-output lib/bridge_definitions.dart \
        --wasm
    flutter pub run build_runner build

lint:
    cd native && cargo fmt
    dart format .

clean:
    flutter clean
    cd native && cargo clean
    
serve *args='':
    flutter pub run flutter_rust_bridge:serve {{args}}

# vim:expandtab:sw=4:ts=4
