<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * CursosUsuarios
 *
 * @ORM\Table(name="cursos_usuarios", indexes={@ORM\Index(name="IDX_7B4DE1C7DB38439E", columns={"usuario_id"}), @ORM\Index(name="IDX_7B4DE1C787CB4A1F", columns={"curso_id"})})
 * @ORM\Entity
 */
class CursosUsuarios
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cursos_usuarios_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="tipo", type="integer", nullable=true)
     */
    private $tipo;

    /**
     * @var \Usuarios
     *
     * @ORM\ManyToOne(targetEntity="Usuarios")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="usuario_id", referencedColumnName="id")
     * })
     */
    private $usuario;

    /**
     * @var \Cursos
     *
     * @ORM\ManyToOne(targetEntity="Cursos")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="curso_id", referencedColumnName="id")
     * })
     */
    private $curso;


}

