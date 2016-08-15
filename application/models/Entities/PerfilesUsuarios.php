<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * PerfilesUsuarios
 *
 * @ORM\Table(name="perfiles_usuarios", indexes={@ORM\Index(name="IDX_6A7AE31F57291544", columns={"perfil_id"}), @ORM\Index(name="IDX_6A7AE31FDB38439E", columns={"usuario_id"})})
 * @ORM\Entity
 */
class PerfilesUsuarios
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="perfiles_usuarios_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var \Perfiles
     *
     * @ORM\ManyToOne(targetEntity="Perfiles")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="perfil_id", referencedColumnName="id")
     * })
     */
    private $perfil;

    /**
     * @var \Usuarios
     *
     * @ORM\ManyToOne(targetEntity="Usuarios")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="usuario_id", referencedColumnName="id")
     * })
     */
    private $usuario;


}

