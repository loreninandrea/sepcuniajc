<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * MateriasDocente
 *
 * @ORM\Table(name="materias_docente", indexes={@ORM\Index(name="IDX_3F7C99ABB54DBBCB", columns={"materia_id"})})
 * @ORM\Entity
 */
class MateriasDocente
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="materias_docente_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="docente_id", type="integer", nullable=false)
     */
    private $docenteId;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created", type="datetime", nullable=false)
     */
    private $created;

    /**
     * @var \Materias
     *
     * @ORM\ManyToOne(targetEntity="Materias")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="materia_id", referencedColumnName="id")
     * })
     */
    private $materia;


}

