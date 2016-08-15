<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * MateriasEjecucion
 *
 * @ORM\Table(name="materias_ejecucion", indexes={@ORM\Index(name="IDX_F460A4A7A64A8A17", columns={"tema_id"}), @ORM\Index(name="IDX_F460A4A78BDA3ABD", columns={"materia_plan_id"})})
 * @ORM\Entity
 */
class MateriasEjecucion
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="materias_ejecucion_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="docente_id", type="integer", nullable=true)
     */
    private $docenteId;

    /**
     * @var integer
     *
     * @ORM\Column(name="representante_id", type="integer", nullable=true)
     */
    private $representanteId;

    /**
     * @var string
     *
     * @ORM\Column(name="confirmado", type="string", nullable=true)
     */
    private $confirmado;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created", type="datetime", nullable=true)
     */
    private $created = 'now()';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="update", type="datetime", nullable=true)
     */
    private $update = 'now()';

    /**
     * @var integer
     *
     * @ORM\Column(name="horas", type="integer", nullable=true)
     */
    private $horas;

    /**
     * @var \MateriasPlanTemas
     *
     * @ORM\ManyToOne(targetEntity="MateriasPlanTemas")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="tema_id", referencedColumnName="id")
     * })
     */
    private $tema;

    /**
     * @var \MateriasPlan
     *
     * @ORM\ManyToOne(targetEntity="MateriasPlan")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="materia_plan_id", referencedColumnName="id")
     * })
     */
    private $materiaPlan;


}

