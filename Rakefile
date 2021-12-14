# Default target, if no is provided
task default: [:setup]

# Steps for project environment setup
task :setup => [
    :pre_setup,
    :create_iphone_archive,
    :create_ios_similator_archive,
    :create_xcframework,
]

# Color Helper
class String
    def colorize(color_code)
        "\e[#{color_code}m#{self}\e[0m"
    end
  
    def green
        colorize(32)
    end
end

task :pre_setup do
    puts 'Clear all archive ...'.green
    sh 'rm -rf xcframework && mkdir xcframework'
end

task :create_iphone_archive do
    puts "DFramework's SDK for iOS is archiving ...".green
    sh 'xcodebuild archive \
    -scheme DFramework \
    -archivePath xcframework/DFramework-iOS.xcarchive \
    -sdk iphoneos \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES' 
end

task :create_ios_similator_archive do
    puts "DFramework's SDK for iOS Similator is archiving ...".green
    sh 'xcodebuild archive \
    -scheme DFramework \
    -archivePath xcframework/DFramework-iOS-Sim.xcarchive \
    -sdk iphonesimulator \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES'
end

task :create_xcframework do
    puts "Creating xcframework ...".green
    sh 'xcodebuild -create-xcframework \
    -framework xcframework/DFramework-iOS.xcarchive/Products/Library/Frameworks/DFramework.framework \
    -framework xcframework/DFramework-iOS-Sim.xcarchive/Products/Library/Frameworks/DFramework.framework \
    -output xcframework/DFramework.xcframework'
    puts "DFramework's xcframework output was created successfully.".green

    sh 'rm -rf xcframework/DFramework-iOS.xcarchive'
    sh 'rm -rf xcframework/DFramework-iOS-Sim.xcarchive'

    sh 'open xcframework/'
end  