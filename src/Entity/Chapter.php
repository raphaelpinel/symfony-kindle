<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ChapterRepository")
 */
class Chapter
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Ebook", inversedBy="chapters")
     * @ORM\JoinColumn(nullable=false)
     */
    private $Ebook;

    /**
     * @ORM\Column(type="string", length=96)
     */
    private $title;

    /**
     * @ORM\Column(type="integer")
     */
    private $number;

    /**
     * @ORM\Column(type="text")
     */
    private $text;

    public function __toString(){
        return (string) $this->getTitle() . "-";
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

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getNumber()
    {
        return $this->number;
    }

    public function setNumber(string $number): self
    {
        $this->number = $number;

        return $this;
    }

    public function getText(): ?string
    {
        return $this->text;
    }

    public function setText(string $text): self
    {
        $this->text = $text;

        return $this;
    }
}
