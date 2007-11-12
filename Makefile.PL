use inc::Module::Install;
name 'Business-Address-POBox';
all_from 'lib/Business/Address/POBox.pm';
perl_version '5.006';

requires 'Class::Accessor::Complex';
requires 'String::BlackWhiteList';

build_requires 'Test::Differences';
build_requires 'Test::More' => '0.70';

process_templates(
    first_year => 2007,
    rest_from  => "$ENV{HOME}/.mitlib/standard_pod",
    start_tag  => '{%',
    end_tag    => '%}',
);

use_standard_tests(without => 'pod_coverage');
auto_include;
WriteAll;
