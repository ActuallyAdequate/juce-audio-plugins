{
  description = "Audio Plugin Dev Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
    utils.inputs.pkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux" "i686-linux" "aarch64-linux" "x86_64-darwin"
  ] (system: 
    let 
      pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
    in {
      # define dev shell stuff
      devShell = pkgs.mkShell rec {
        name = "C++ JUCE Dev Environment";

        packages = with pkgs; [
          # Dev tools
          llvmPackages_11.clang
          
          cmakeCurses   
          pkg-config
          cmake
          alsa-lib
          freetype
          gtk3
          libcpr
          webkitgtk
          pcre

          reaper

#          pkgsCross.mingwW64.buildPackages.gcc
 #         pkgsCross.mingwW64.windows.pthreads                    
           
          #vscode extensions
          (vscode-with-extensions.override {
            vscodeExtensions = with vscode-extensions; [
              llvm-vs-code-extensions.vscode-clangd
              ms-vscode.cpptools
              vadimcn.vscode-lldb
              ms-vscode.cmake-tools
              twxs.cmake
            ];
          })       
        ];
        shellHook = ''
        echo Audio Plugin Dev
        cmake --version
        clang --version
        VST_PATH=~/.vst/
        
        code .
      '';
      };
      
    }
  );
}

