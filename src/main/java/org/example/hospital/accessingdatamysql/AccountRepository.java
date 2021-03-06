package org.example.hospital.accessingdatamysql;

import org.example.hospital.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AccountRepository extends JpaRepository<Account,Integer> {
  Optional<Account> findByLogin(String login);
}
