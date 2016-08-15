<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * Comentarios
 *
 * @ORM\Table(name="comentarios", indexes={@ORM\Index(name="IDX_F54B3FC044E38B19", columns={"materia_ejecucion_id"})})
 * @ORM\Entity
 */
class Comentarios
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="comentarios_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="autor", type="integer", nullable=true)
     */
    private $autor;

    /**
     * @var string
     *
     * @ORM\Column(name="descripcion", type="string", length=500, nullable=true)
     */
    private $descripcion;

    /**
     * @var integer
     *
     * @ORM\Column(name="usuario_id", type="integer", nullable=true)
     */
    private $usuarioId;

    /**
     * @var integer
     *
     * @ORM\Column(name="tipo", type="integer", nullable=false)
     */
    private $tipo;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created", type="datetime", nullable=true)
     */
    private $created = 'now()';

    /**
     * @var \MateriasPlan
     *
     * @ORM\ManyToOne(targetEntity="MateriasPlan")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="materia_ejecucion_id", referencedColumnName="id")
     * })
     */
    private $materiaEjecucion;


}

