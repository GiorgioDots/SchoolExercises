package beans;

public class CreateWord implements java.io.Serializable {
	private String meaning = "";
	private SQLHandler handler;

	public CreateWord() {
		handler = new SQLHandler();
	}

	public void setMeaning(String val) {
		this.meaning = val;
	}

	public void setWord(String val) {
		handler.updateQuery("INSERT INTO `dictionary` (`id`, `word`, `meaning`) VALUES (NULL, '" + val + "', '"
				+ this.meaning + "');");
	}
}