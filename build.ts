import { type Build } from 'xbuild';

const build: Build = {
    common: {
        project: 'libyaml',
        archs: ['x64'],
        variables: [],
        copy: {},
        defines: [],
        options: [
            ['BUILD_SHARED_LIBS', false],
            ['BUILD_TESTING', false],
        ],
        subdirectories: ['libyaml'],
        libraries: {
            yaml: {
                name: 'libyaml'
            }
        },
        buildDir: 'build',
        buildOutDir: '../libs',
        buildFlags: []
    },
    platforms: {
        win32: {
            windows: {},
            android: {
                archs: ['x86', 'x86_64', 'armeabi-v7a', 'arm64-v8a'],
            }
        },
        linux: {
            linux: {}
        },
        darwin: {
            macos: {}
        }
    }
}

export default build;