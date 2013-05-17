use strict;
use warnings;

use Alien::Base::ModuleBuild;

my $builder = Alien::Base::ModuleBuild->new(
    module_name => 'Alien::QEMU',
    dist_abstract => 'Easy installation of the QEMU',
    license => 'gpl',
    configure_requires => {
        'Alien::Base' => 0,
    },
    requires => {
        'perl' => '5.8.1',
        'Alien::Base' => 0,
    },
    dist_author => 'ytnobody <ytnobody aaattt gmail>',
    alien_name => 'qemu',
    alien_repository => {
        protocol => 'local',
        location => 'inc/',
        pattern => qr/^qemu-([\d\.]+)\.tar\.bz2$/,
    },
    alien_build_commands => $ENV{ALIEN_QEMU_INSTALL_PATH} ? 
        ['%pconfigure --prefix='$ENV{ALIEN_QEMU_INSTALL_PATH}. ' '. $ENV{ALIEN_QEMU_BUILD_OPTIONS}, 'make'] : 
        ['%pconfigure --prefix=%s '. $ENV{ALIEN_QEMU_BUILD_OPTIONS}, 'make'] ,
    alien_install_commands => [
        'make install',
    ],
);
$builder->create_build_script;
