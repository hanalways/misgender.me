
class GenderMe
  attr_reader :result, :username

  def initialize(username)
    @username = username
    @result = gender_user(username)
  end

  private

  def gender_user(username)
    user = TwitterUser.fetch_user(username)

    face_gender = FaceGender.list(user.profile_image_url.to_s)

    name_gender = NameGender.request(user.name, "US")

    bio = user.bio
    user_bio_gender = PostsGender.request(bio)
    user_bio_gender = "Male" if user_bio_gender == "m"
    user_bio_gender = "Female" if user_bio_gender == "f"

    tweets = user.tweets
    post_genders = []
    tweets.each do |tweet|
      post_genders << PostsGender.request(tweet)
    end

    percent_female = post_genders.count { |gender| gender == "f" } / post_genders.length.to_f
    percent_male = post_genders.count { |gender| gender == "m" } / post_genders.length.to_f
    gender_breakdown = { male: "#{percent_male * 100}%",
                        female: "#{percent_female * 100}%" }

    result = { face_gender: face_gender.assigned_gender,
               name_gender: name_gender.assigned_gender,
               user_bio_gender: user_bio_gender,
               posts_gender: gender_breakdown }
    return result
  end
end
