Attempt.create!([
  {date: "2016-04-10 18:16:00", medium: "Email boss", summary: "blah blah blah", job_id: nil},
  {date: "2016-04-09 18:48:00", medium: "emailed Mikael", summary: "said yo yo brother whats up!?", job_id: nil},
  {date: "2016-04-09 18:54:00", medium: "showed up", summary: "hahaha", job_id: 5},
  {date: "2016-04-09 19:03:00", medium: "sent a postcard", summary: "it was pretty", job_id: 5},
  {date: "2016-04-10 04:51:00", medium: "gave a holla", summary: "it was loud", job_id: 2},
  {date: "2016-04-09 18:19:00", medium: "called the office", summary: "talked to susan and left a voicemail", job_id: 2}
])
Company.create!([
  {name: "BangBrothers", address: "not far enough", main_phone: "305 555 5555 ", useful_links: "", notes: ""},
  {name: "MAD hatters", address: "not far enough", main_phone: "305 555 5555 ", useful_links: "", notes: ""},
  {name: "powder whites", address: "not far enough", main_phone: "305 555 5555 ", useful_links: "", notes: "I like it\r\na lot\r\nvery very much\r\nmucho mucho"},
  {name: "DCI", address: "too close to home", main_phone: "305 555 5555", useful_links: "this one\r\n", notes: ""},
  {name: "HappyRus", address: "nowhere to be found", main_phone: "", useful_links: "", notes: ""}
])
Honcho.create!([
  {name: "Mr C", position: "Know it All", phone_number: "305 555 5555", email: "", notes: "", links: "", company_id: 4},
  {name: "Prince Charming", position: "his own", phone_number: nil, email: nil, notes: nil, links: nil, company_id: 3},
  {name: "Snake Charmer", position: "untouchable", phone_number: nil, email: nil, notes: nil, links: nil, company_id: 3},
  {name: "BigBoy", position: "master", phone_number: "", email: "", notes: "", links: "", company_id: 4},
  {name: "BigLove", position: "top", phone_number: "", email: "", notes: "just can't get enough", links: "", company_id: 1},
  {name: "Mr.D", position: "underwhelming", phone_number: "786 555 5555", email: "", notes: "", links: "", company_id: 4},
  {name: "Sonny Boy", position: "dreamy", phone_number: "", email: "", notes: "", links: "", company_id: 2},
  {name: "Achuchita", position: "bolseada", phone_number: "", email: "", notes: "", links: "", company_id: 6}
])
Job.create!([
  {position: "Senior Penetration Tester", web_address: "https://www.mydreamjob.com", user_id: 2, archived: false, company_id: 2},
  {position: "here", web_address: "", user_id: 2, archived: true, company_id: 5},
  {position: "Stand In", web_address: "https://www.aholynumberofyears.com", user_id: 2, archived: false, company_id: 1},
  {position: "\"handy\" man", web_address: "https://www.bestjobever.com", user_id: 2, archived: false, company_id: 1},
  {position: "top", web_address: "https://www.myfavoriteones.com", user_id: 2, archived: false, company_id: 4},
  {position: "plasterer", web_address: "https://www.molikejobdescription.com", user_id: 2, archived: true, company_id: 4},
  {position: "Jack", web_address: "https://jackofalltrades.com", user_id: 2, archived: false, company_id: nil},
  {position: "midwife", web_address: "https://www.wyncode.co", user_id: 1, archived: false, company_id: 4},
  {position: "Magician", web_address: "", user_id: 1, archived: false, company_id: nil}
])
User.create!([
  {name: "Izzy", email: "mail@izzy.com", password_digest: "$2a$10$fU.MsQDyYiIM7/yzE64loOMonOoKIVMMP5uFO7JNq5m1u6hdAU4Ya"},
  {name: "Machi", email: "mail@machi.com", password_digest: "$2a$10$UbW9JAfkphnCronqPT5JD.eFJxJFF2jVR0jp4wR/LnnBXIPS6YxHG"},
  {name: "Pepe", email: "mail@pepe.com", password_digest: "$2a$10$AyY7cjaLBC8J99/J0hZju.744L3kTpUO6Cf7vaRUT4ewU1KV7Mnqy"},
  {name: "Chanchis", email: "mail@chanchis.com", password_digest: "$2a$10$wll/rc5E5V7J6SbuKupG2.TFsctYd71a/xNM94tIcom2.PQqDaSi2"}
])
