<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * CursosMaterias
 *
 * @ORM\Table(name="cursos_materias", indexes={@ORM\Index(name="IDX_840D1E5587CB4A1F", columns={"curso_id"}), @ORM\Index(name="IDX_840D1E55B54DBBCB", columns={"materia_id"})})
 * @ORM\Entity
 */
class CursosMaterias
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cursos_materias_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var \Cursos
     *
     * @ORM\ManyToOne(targetEntity="Cursos")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="curso_id", referencedColumnName="id")
     * })
     */
    private $curso;

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

