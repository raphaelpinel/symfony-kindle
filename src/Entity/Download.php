<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\DownloadRepository")
 */
class Download
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=64)
     */
    private $username;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Ebook", inversedBy="downloads")
     * @ORM\JoinColumn(nullable=false)
     */
    private $Ebook;

    /**
     * @ORM\Column(type="datetime")
     */
    private $date;

  // necessary to return a string to avoid the error: "Catchable Fatal Error: Object of class App\Entity\Download could not be converted to string"
  public function __toString() {
    return $this->getUsername();
}  

    public function getId()
    {
        return $this->id;
    }

    public function getUsername(): ?string
    {
        return $this->username;
    }

    public function setUsername(string $username): self
    {
        $this->username = $username;

        return $this;
    }

    public function getEbook(): ?Ebook
    {
        return $this->Ebook;
    }

    public function setEbook(?Ebook $Ebook): self
    {
        $this->Ebook = $Ebook;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(\DateTimeInterface $date): self
    {
        $this->date = $date;

        return $this;
    }
}
