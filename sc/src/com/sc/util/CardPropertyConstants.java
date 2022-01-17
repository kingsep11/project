package com.sc.util;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

public class CardPropertyConstants {
	private static final String BUNDLE_NAME = "envutil"; //$NON-NLS-1$
	public static String SERVER_ROOT = "";
	private static final ResourceBundle RESOURCE_BUNDLE = ResourceBundle
			.getBundle(BUNDLE_NAME);

	private CardPropertyConstants() {
	}

	public static String getString(String key) {
		try {
			return RESOURCE_BUNDLE.getString(key);
		} catch (MissingResourceException e) {
			return '!' + key + '!';
		}
	}
}
