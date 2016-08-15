<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * Perfiles
 *
 * @ORM\Table(name="perfiles")
 * @ORM\Entity
 */
class Perfiles
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="perfiles_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=100, nullable=true)
     */
    private $nombre;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created", type="date", nullable=true)
     */
    private $created;


}

