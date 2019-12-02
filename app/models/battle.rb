class Battle < ApplicationRecord
    enum status:{attack: 0,spells:1,defend:2,item:3, abilities:4}
end
