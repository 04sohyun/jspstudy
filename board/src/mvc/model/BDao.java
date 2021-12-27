package mvc.model;

public class BDao {
	private static BDao instance;
	private BDao() {}
	public static BDao getinstace() {
		if(instance==null) instance=new BDao();
		return instance;
	}
	
	
}
