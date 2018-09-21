<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\FileRepository")
 */
class File
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Ebook", inversedBy="files")
     * @ORM\JoinColumn(nullable=false)
     */
    private $Ebook;

    /**
     * @ORM\Column(type="string", length=48)
     */
    private $format;

    /**
     * @ORM\Column(type="string", length=96)
     */
    private $fileName;
    
    public function __toString() {
        return (string) $this->getFileName() . "-";
    }

    public function getId()
    {
        return $this->id;
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

    public function getFormat(): ?string
    {
        return $this->format;
    }

    public function setFormat(string $format): self
    {
        $this->format = $format;

        return $this;
    }

    public function getFileName(): ?string
    {
        return $this->fileName;
    }

    public function setFileName(string $fileName): self
    {
        $this->fileName = $fileName;

        return $this;
    }
}
