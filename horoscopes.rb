class Horoscope

  def self.put_some_adjectives
    adjectives = ["ambitious", "analytical", "blindly optimistic", "boisterous", "bold", "careless", "caring", "careful", "charming", "compassionate", "competitive", "conservative", "convivial", "contrary", "creative", "deep", "delicate", "detached", "determined", "devoted", "diplomatic", "disciplined","dramatic", "eager", "empathic", "energetic", "enjoy working with your hands", "exuberant", "fair-minded", "fiery", "flirtacious", "forgiving", "frank", "freedom-loving", "friendly", "funny", "generous", "gentle", "good-humored", "gregarious", "honest", "humanitarian", "humble", "humorous", "indecisive", "independent", "impatient", "imaginative", "intellectual", "intense", "intoverted", "intractable", "intuitive", "inventive", "irresponsible", "jovial", "kind", "loyal", "magnetic", "methodical", "moody", "modest", "never boring", "observant", "obstinate", "optimistic", "original", "outgoing", "patient", "passionate", "perverse", "philosophical", "plucky", "placid", "practical", "quick", "ready for fun", "reliable", "resentful", "restless", "restless", "self assured", "sensitive", "sensible", "sentimental", "sentimental", "serious", "sharpwitted", "shy", "sincere", "stable", "straightforward", "stubborn", "superficial", "tactless", "undisciplined", "unemotional", "unpredictable", "unworldly"] 
    number_of_characteristics = rand(4..6)
    adj_string = ""
   number_of_characteristics.times { adj_string << adjectives.sample << ", " }
    adj_string << "and " + adjectives.sample
  end

  def self.return_random_horoscope(sign)
    "You are a " + sign + ". You are: " + self.put_some_adjectives
  end

  def self.valid_sign?(sign)
    signs_list = %w[aries virgo sagittarius leo pisces aquarius scorpio cancer capricorn libra taurus gemini]
    signs_list.include? sign
  end

  def self.dropdown
    Horoscope.valid_sign.each do |sign|
      sign
    end
  end
end