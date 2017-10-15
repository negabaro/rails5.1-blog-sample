class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  # TODO: これなくても動いたのでとりあえずコメントアウトしました。
  #, :omniauth_providers => [:twitter]

  has_many :articles
  has_many :comments

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing_profile_img.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(user_nickname:     auth.info.nickname,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    User.create_unique_email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(user_nickname:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end

  #def self.from_omniauth(auth)
    # providerとuidでUserレコードを取得する
    # 存在しない場合は、ブロック内のコードを実行して作成する
    #where(auth.slice(:provider, :uid)).first_or_create do |user|
  #  where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
  #    user.provider = auth["provider"]
  #    user.uid = auth["uid"]
      #user.username = auth["info"]["nickname"]
      #user.username = auth.info.nickname
  #  end
  #end

  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      #new(session["devise.user_attributes"], without_protection: true) do |user|
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end


end
