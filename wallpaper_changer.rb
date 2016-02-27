require 'RMagick'
require 'appscript'

class WallpaperChanger
  QUOTES = [
    "Life is about making an impact, not making an income. –Kevin Kruse",
    "Whatever the mind of man can conceive and believe, it can achieve. –Napoleon Hill",
    "Strive not to be a success, but rather to be of value. –Albert Einstein",
    "Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference.  –Robert Frost",
    "I attribute my success to this: I never gave or took any excuse. –Florence Nightingale",
    "The most difficult thing is the decision to act, the rest is merely tenacity. –Amelia Earhart",
    "Every strike brings me closer to the next home run. –Babe Ruth",
    "Definiteness of purpose is the starting point of all achievement. –W. Clement Stone",
    "Life isn’t about getting and having, it’s about giving and being. –Kevin Kruse",
    "Life is what happens to you while you’re busy making other plans. –John Lennon",
    "We become what we think about. –Earl Nightingale",
    "Life is 10% what happens to me and 90% of how I react to it. –Charles Swindoll",
    "The most common way people give up their power is by thinking they don’t have any. –Alice Walker",
    "The mind is everything. What you think you become.  –Buddha",
    "The best time to plant a tree was 20 years ago. The second best time is now. –Chinese Proverb",
    "An unexamined life is not worth living. –Socrates",
    "Eighty percent of success is showing up. –Woody Allen",
    "Your time is limited, so don’t waste it living someone else’s life. –Steve Jobs",
    "Winning isn’t everything, but wanting to win is. –Vince Lombardi",
    "I am not a product of my circumstances. I am a product of my decisions. –Stephen Covey",
    "You can never cross the ocean until you have the courage to lose sight of the shore. –Christopher Columbus",
    "I’ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel. –Maya Angelou",
    "Either you run the day, or the day runs you. –Jim Rohn",
    "Whether you think you can or you think you can’t, you’re right. –Henry Ford",
    "The two most important days in your life are the day you are born and the day you find out why. –Mark Twain",
    "Whatever you can do, or dream you can, begin it.  Boldness has genius, power and magic in it. –Johann Wolfgang von Goethe",
    "The best revenge is massive success. –Frank Sinatra",
    "People often say that motivation doesn’t last. Well, neither does bathing. That’s why we recommend it daily. –Zig Ziglar",
    "Life shrinks or expands in proportion to one’s courage. –Anais Nin"
  ]

  def run
    img = Magick::Image.new(2000, 400){self.background_color = 'black'}

    copyright = Magick::Draw.new
    copyright.annotate(img, 0, 0, 0, 0, QUOTES.sample) do
      self.font = 'Helvetica'
      self.pointsize = 25
      self.font_weight = Magick::BoldWeight
      self.fill = 'white'
      self.gravity = Magick::CenterGravity
    end

    `rm ./*.png`
    filename = "desktop-#{Time.now.to_s}.png"
    img.write(filename)
    Appscript.app("System Events").desktops.picture.set("#{Dir.pwd}/#{filename}")
  end
end
