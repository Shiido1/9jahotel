class LoginEntityModel {
	String? email;
	String? password;
	String? deviceName;

	LoginEntityModel({this.email, this.password, this.deviceName});

	factory LoginEntityModel.fromJson(Map<String, dynamic> json) {
		return LoginEntityModel(
			email: json['email'] as String?,
			password: json['password'] as String?,
			deviceName: json['device_name'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'email': email,
				'password': password,
				'device_name': deviceName,
			};
}
