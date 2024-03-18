package com.br.projetointegrador.baraabbAPI.model;

import java.io.Serializable;
import java.util.Objects;

public abstract class AbstractEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	public abstract Long getId();
	
	@Override
	public boolean equals(Object other) {

		if (other instanceof AbstractEntity) {
			AbstractEntity otherModel = (AbstractEntity) other;
			return Objects.equals(getId(), otherModel.getId());
		}
		return false;
	}
}
