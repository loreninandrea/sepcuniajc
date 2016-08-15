<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * MateriasPlanTemas
 *
 * @ORM\Table(name="materias_plan_temas", indexes={@ORM\Index(name="IDX_BE75DF23B54DBBCB", columns={"materia_id"})})
 * @ORM\Entity
 */
class MateriasPlanTemas
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="materias_plan_temas_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="titulo", type="string", length=500, nullable=true)
     */
    private $titulo;

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

