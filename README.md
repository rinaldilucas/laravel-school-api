<div id="top"></div>

[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/rinaldilucas/laravel-school-api">
    <img src="./public/images/logo.png" alt="Logo">
  </a>

  <h3 align="center">Laravel School REST API</h3>

  <p align="center">
    Project built using PHP, Laravel, Composer, and MySQL <br>to jump-start your studies!
    <br />
    <a href="https://github.com/rinaldilucas/laravel-school-api"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <s>View App</s>
    · 
    <a href="#donations">Donate</a>       
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#donations">Donations</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

<div align="center">

[![Project Screenshot][project-screenshot]](https://rinaldilucas.github.io/laravel-school-api/)

</div>

This straightforward project was created using Laravel for educational purposes. If you found this repository helpful, please feel free to show your support by giving it a star or contributing via a pull request!

Here are some of the features:

### Backend

-   Built using REST API practices
-   Authentication using Sanctum
-   Password encryption using bcrypt with salt rounds
-   Authentication with brute force prevention using ExpressBrute
-   Example of a migration changing columns and handling data on production
-   Custom command to run migrations and seeders
-   API documentation using Swagger
-   Several test examples using PHPUnit
-   Package management using composer
-   Factories using faker to help with tests and seeding
-   Example of endpoint receiving http data with custom names
-   Data removal using soft delete

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

This section shows what technologies are used in this particular project.

-   [PHP](https://www.php.net/)
-   [Laravel](https://laravel.com/)
-   [Composer](https://getcomposer.org/)
-   [MySQL](https://www.mysql.com/)
-   [PHPUnit](https://phpunit.de/)
-   [Swagger](https://swagger.io/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

After cloning the project, you need to do a few things to be able to run it.

### Prerequisites

You need to have the following requirements:

-   mysql <a target="_blank" href="https://dev.mysql.com/downloads/mysql/">(download here)</a>
-   composer <a target="_blank" href="https://getcomposer.org/download/">(download here)</a>
-   php 8.2 <a target="_blank" href="https://www.php.net/downloads.php">(download here)</a>
-   apache <a target="_blank" href="https://httpd.apache.org/download.cgi">(download here for Linux)</a>
    or
-   xampp <a target="_blank" href="https://www.apachefriends.org/">(download here)</a>

### Installation

_Below is an example of how you can run the project._<br>
_More scripts at package.json_

1. Clone the repo
    ```sh
    git clone https://github.com/rinaldilucas/laravel-school-api.git
    ```
2. Setup the necessary environment variables
    ```
    https://medium.com/chingu/an-introduction-to-environment-variables-and-how-to-use-them-f602f66d15fa
    ```
3. Install packages via composer
    ```sh
    composer install
    ```
4. Populate the database
    ```js
    php artisan custom:run
    ```
5. Run tests
    ```js
    php artisan test
    ```
    <p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## Usage

You can seed the database as shown before or seed the database via `./database/database.sql`. You can also import the Insomnia routes via file `./database/routes-collection.json`.<br>Below are the implemented routes: you also can view them inside `./routes/api.php` file or through the Swagger documentation at `http://localhost:80/api/documentation/`.

```js
-------------------------------
-------- [AUTH ROUTES] --------
-------------------------------
[POST] localhost:80/api/auth/login -> 'login'
```

```js
-------------------------------
-------- [USER ROUTES] --------
-------------------------------
[GET] localhost:80/api/user -> 'getOne'
```

```js
-------------------------------
------- [SCHOOL ROUTES] -------
-------------------------------
[GET] localhost:80/api/escolas -> 'getAll'
[GET] localhost:80/api/escolas/{id}/alunos -> 'getAllStudentsBySchool'
```

```js
-------------------------------
------ [STUDENT ROUTES] -------
-------------------------------
[POST] localhost:80/api/alunos -> 'create'
[PUT] localhost:80/api/alunos/{id} -> 'update'
[DELETE] localhost:80/api/alunos/{id} -> 'remove'
```

```js
-------------------------------
------ [CLASSROOM ROUTES] -----
-------------------------------
[GET] localhost:80/api/turmas/{id}/alunos -> 'getAllStudentsByClassroom'
[POST] localhost:80/api/turmas -> 'create'
[PUT] localhost:80/api/turmas/{id} -> 'update'
[DELETE] localhost:80/api/turmas/{id} -> 'remove'
```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/amazing-feature`)
3. Commit your Changes (`git commit -m 'feat: add some amazing feature'`)
4. Push to the Branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the MIT License. See [LICENSE](./LICENSE) for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

[![Website](https://img.shields.io/badge/-Website-0078D4?style=flat-square&logo=html5&logoColor=white&link=https://lucasreinaldi.com.br)](https://rinaldilucas.com)
[![Github](https://img.shields.io/badge/-Github-967bb5?style=flat-square&labelColor=967bb5&logo=github&logoColor=white&link=https://github.com/rinaldilucas)](https://github.com/rinaldilucas)
[![Gmail Badge](https://img.shields.io/badge/-Gmail-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:lucasreinaldi@gmail.com)](mailto:lucasreinaldi@gmail.com)
[![Hotmail Badge](https://img.shields.io/badge/-Hotmail-0078D4?style=flat-square&logo=microsoft-outlook&logoColor=white&link=mailto:lucasreinaldi@hotmail.com)](mailto:lucasreinaldi@hotmail.com)
[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/rinaldilucas/)](https://www.linkedin.com/in/rinaldilucas/)
[![Telegram Badge](https://img.shields.io/badge/-Telegram-1ca0f1?style=flat-square&labelColor=1ca0f1&logo=telegram&logoColor=white&link=https://t.me/rinaldilucas)](https://t.me/rinaldilucas)

Project Link: [https://github.com/rinaldilucas/laravel-school-api](https://github.com/rinaldilucas/laravel-school-api)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Donations

If you feel that this project has helped you in any way, whether it's attracting clients or teaching you about the technologies used, feel free to make a donation.
It helps me a lot to continue developing open-source codes.

-   Metamask (USDT):
    ```sh
    0x16362DF7f963CeEBB2114B467B68F5A58972ee65
    ```
-   PIX (BRL):
    ```sh
    72140bc8-fadc-42f5-abb6-9c13cc80a59f
    ```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/rinaldilucas/laravel-school-api.svg?style=for-the-badge
[contributors-url]: https://github.com/rinaldilucas/laravel-school-api/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/rinaldilucas/laravel-school-api.svg?style=for-the-badge
[forks-url]: https://github.com/rinaldilucas/laravel-school-api/network/members
[stars-shield]: https://img.shields.io/github/stars/rinaldilucas/laravel-school-api.svg?style=for-the-badge
[stars-url]: https://github.com/rinaldilucas/laravel-school-api/stargazers
[license-shield]: https://img.shields.io/github/license/rinaldilucas/laravel-school-api.svg?style=for-the-badge
[license-url]: https://github.com/rinaldilucas/laravel-school-api/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/rinaldilucas/
[project-screenshot]: ./public/images/screenshot.jpg
