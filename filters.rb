# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    if @candidates.include?(id)
      return id
    else
      return nil
    end
  end
  
  def experienced?(candidate)
    if candidate.years_of_experience >= 2
      return true
    else
      return false
    end
  end
  
  def qualified_candidates(candidates)
    for candidate in candidates
      if experienced?(candidate) && (candidate.languages.include?('Ruby') || candidate.languages.include?('Python')) && candidate.github_points >= 100 && candidate.age >= 18 && (candidate.date_applied >= 15.days.ago.to_date)
        return true
      else
        return false
      end
    end
  end
  
  # More methods will go below

  def ordered_by_qualifications(candidates)
    candidates.sort_by {|candidate| [candidate[:years_of_experience], candidate[:github_points]]}.reverse
  end