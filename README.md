# Coinmarketcap-Web-Scraper

For this project I created a web scraper that returns a list of prices for different types of assets you can choose from the program's welcome menu. The information is taken from http:/coinmarketcap.com. To parse the HTML from it I've used Nokogiri gem, and to give it format and take specific data from it I've used HTTParty gem. To do the testings, I've used Rspec.

## Built With

- Ruby
- Ruby rspec
- Nokogiri
- HTTParty
- VS Code

## Getting Started

![see installation animated tutorial](./gif/installguide.gif)

- open CMD
- Git clone `https://github.com/Coinmarketcap-Web-Scraper` 
- Make sure Ruby is installed on your computer
- In your terminal, type:
   gem install rspec
   gem install httparty
   gem install nokogiri

- Then, to run the program type `ruby bin/main.rb`


## Author

**German Aquila**

- GitHub: [@realisticattorney](https://github.com/realisticattorney)
- Twitter: [@ContoliAxl](https://www.twitter.com/contoliaxl)
- Linkedin: [@germanaquila](https://www.linkedin.com/in/german-aquila-55a9171b5/)

Special thanks to the people from coinmarketcap.com

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/realisticattorney/Coinmarketcap-Web-Scraper/issues).

## 📝 License

This project is [MIT](./LICENSE) licensed.