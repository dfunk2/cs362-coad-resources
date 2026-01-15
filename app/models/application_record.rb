#Inherits from the ActiveRecord module and the Base class within it. Servers as a conduite for other modules
#to access the ActiveRecord module. The ActiveRecord module gives modules access to ruby on rails functionality. 
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
