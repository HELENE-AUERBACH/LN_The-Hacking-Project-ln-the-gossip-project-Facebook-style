class SessionsController < ApplicationController
  def new
    # Méthode qui crée le hash session vide et l'envoie à une view (new.html.erb)
    # qui affiche le formulaire de login pour stocker l'Id de l'utilisateur actuellement connecté
    session = {:user_id => nil}
  end

  def create
    # Méthode qui "remplit" le hash session/sauvegarde l'Id de l'utilisateur connecté dans session,
    # après avoir effectué l'authentification (traitement des informations saisies dans la page login par l'utilisateur,
    # à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur).
    # Pour info, le contenu de ce formulaire sera accessible dans le hash params
    puts "$" * 60
    puts "Salut, je suis dans le serveur pour une authentification"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ email : #{params["email"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ password : #{params["password"]}"

    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params["email"])
    
    # vérifie si l'utilisateur existe bien ET si l'authentification (méthode bcrypt) réussit avec le mot de passe 
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      notice_text = "Bienvenue #{user.first_name} !"
      redirect_to root_path, status: :ok, notice: notice_text
    else
      # S'il n'est pas bien authentifié, on fera un redirect vers la page de login avec le message d'erreur.
      redirect_to new_session_path, status: 401, notice: 'Invalid email/password combination'
    end
    puts "$" * 60
  end

  def destroy
    # Méthode qui permet de déconnecter l'utilisateur en supprimant le contenu de session[:user_id]
    session.delete(:user_id)
    redirect_to root_path, status: :ok, notice: 'Au revoir !'
  end
end
