class RegisterEntityModel {
	String? firstname;
	String? lastname;
	String? email;
	String? phone;
	String? password;
	String? passwordConfirmation;

	RegisterEntityModel({
		this.firstname, 
		this.lastname, 
		this.email, 
		this.phone, 
		this.password, 
		this.passwordConfirmation, 
	});

	factory RegisterEntityModel.fromJson(Map<String, dynamic> json) {
		return RegisterEntityModel(
			firstname: json['firstname'] as String?,
			lastname: json['lastname'] as String?,
			email: json['email'] as String?,
			phone: json['phone'] as String?,
			password: json['password'] as String?,
			passwordConfirmation: json['password_confirmation'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'firstname': firstname,
				'lastname': lastname,
				'email': email,
				'phone': phone,
				'password': password,
				'password_confirmation': passwordConfirmation,
			};
}
