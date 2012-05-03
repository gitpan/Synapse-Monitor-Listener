package Synapse::Monitor::Listener::Action;
use base qw /Synapse::CLI::Config::Object/;
use YAML::XS;
use File::Spec;
use Time::HiRes;
use warnings;
use strict;


sub process {
    my $self  = shift;
    my $event = shift;
    my $tmp   = File::Spec->tmpdir() . '/' . Time::HiRes::time() . '.tmp.yml';
    my $exec  = $self->label();
    system_execute ("YAML_FILE=$tmp $exec");
    unlink $tmp;
}


sub system_execute {
    my $msg = shift;
    system ($msg);
}


1;


__END__
