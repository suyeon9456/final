package MyBatis;

import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisFactory {
	
	private static SqlSessionFactory factory;

	static {
		try {
			 Reader reader = Resources.getResourceAsReader("/MyBatis/config.xml");
			 factory = new SqlSessionFactoryBuilder().build(reader);
			 
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}

	

}
