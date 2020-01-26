namespace :env_generators do
  desc "Assign tags to categories"
  task assign_tags: :environment do
    Category.other.first.tags.where.not(id: 1).each do |tag| 
      ap "Enter caterory for Tag #{tag.name}"
      r = readline
      tag.assign_category(r)
    end
  end

  desc "Download month from website" 
  task download_from: :environment do
    
  end
end
