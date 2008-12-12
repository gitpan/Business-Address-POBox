use inc::Module::Install;
include 'Module::AutoInstall';

name 'Business-Address-POBox';
all_from 'lib/Business/Address/POBox.pm';
perl_version '5.006';

requires 'Class::Accessor::Complex';
requires 'Class::Accessor::Constructor';
requires 'String::BlackWhiteList' => '0.06';
requires 'Test::Exception';

test_requires 'Test::More' => '0.70';
extra_tests;

auto_install;
auto_include;
WriteAll;
