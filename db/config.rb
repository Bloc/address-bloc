def options(arg)
	if arg.to_s == 'pg'
		{dbname: "address_bloc", user: "noel", password: "deguzman"}
	else
		"db/address_bloc.sqlite"
	end
end
