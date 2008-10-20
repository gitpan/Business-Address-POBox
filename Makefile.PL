use inc::Module::Install;
include 'Module::AutoInstall';

name 'Business-Address-POBox';
all_from 'lib/Business/Address/POBox.pm';
perl_version '5.006';

requires 'Class::Accessor::Complex';
requires 'Class::Accessor::Constructor';
requires 'String::BlackWhiteList' => '0.06';
requires 'Test::Exception';

recommends 'Test::Pod';
recommends 'Test::Pod::Coverage';

test_requires 'Test::More' => '0.70';
test_requires 'Test::Compile';

auto_install;
auto_include;
WriteAll;
