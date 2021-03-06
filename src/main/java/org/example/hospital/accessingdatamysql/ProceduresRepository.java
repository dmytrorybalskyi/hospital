package org.example.hospital.accessingdatamysql;

import org.example.hospital.entity.Doctor;
import org.example.hospital.entity.Procedures;
import org.example.hospital.entity.Status;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProceduresRepository extends JpaRepository<Procedures,Integer> {
    List<Procedures> findByDoctorAndStatus(Doctor doctor, Status status);

    @Modifying
    @Query(value ="UPDATE Procedures p SET p.procedure_status = ? WHERE p.id = ?",nativeQuery = true)
    Integer doProcedure(String status,Integer procedure_id);

    @Modifying
    @Query("SELECT p FROM Procedures p WHERE p.treatment.patient.id = :account_id AND p.status = :status")
    List<Procedures> getAllProceduresByAccountAndStatus(@Param("account_id")Integer account_id,
                                                        @Param("status") Status status);
}
