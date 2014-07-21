# appMetrics=createnewfilefixture,createaccount,getpartition,share 
use Data::Dumper;
my $conf = { 
	'app' =>  [qw/createNewFileFixture createAccount getPartition share/],
	'comp' => [qw/downLoadFile uploadFile/], 
	'plot' => [qw/plot/],
};

foreach my $role (keys %{$conf}) { 
	foreach my $test (@{$conf->{$role}}) { 
		open (INF,"zbx_export_item.xml"); 
		while (<INF>) { 
			s/ROLE/${role}Metrics/;
			s/TEST/$test/;
			print;
		}
	}
}
