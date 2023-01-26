class ApiUrl {
  static const baseUrl = "https://reqres.in";
  static const getUsers = "/api/users";

  static getUser(int id) => "/api/users/$id";
}
