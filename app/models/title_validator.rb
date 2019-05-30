class TitleValidator < ActiveModel::EachValidator
  CLICKBAITS = [/Won't Believe/, /Secret/, /Top [number]/, /Guess/]
  def validate(record)
    if !CLICKBAITS.any? {|bait| bait.match(record.title)}
      record.errors[:title] << 'is invalid if not clickbait'
    end
  end
end
