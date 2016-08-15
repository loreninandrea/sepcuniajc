<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * MateriasPlan
 *
 * @ORM\Table(name="materias_plan", indexes={@ORM\Index(name="IDX_7BB28606A64A8A17", columns={"tema_id"})})
 * @ORM\Entity
 */
class MateriasPlan
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="materias_plan_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="curso_id", type="integer", nullable=true)
     */
    private $cursoId;

    /**
     * @var integer
     *
     * @ORM\Column(name="materia_id", type="integer", nullable=true)
     */
    private $materiaId;

    /**
     * @var integer
     *
     * @ORM\Column(name="horas", type="integer", nullable=true)
     */
    private $horas;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="date", nullable=true)
     */
    private $fecha;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created", type="datetime", nullable=true)
     */
    private $created;

    /**
     * @var integer
     *
     * @ORM\Column(name="semana", type="integer", nullable=true)
     */
    private $semana;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="update", type="datetime", nullable=true)
     */
    private $update;

    /**
     * @var \MateriasPlanTemas
     *
     * @ORM\ManyToOne(targetEntity="MateriasPlanTemas")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="tema_id", referencedColumnName="id")
     * })
     */
    private $tema;


}

