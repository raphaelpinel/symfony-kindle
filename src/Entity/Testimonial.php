<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TestimonialRepository")
 */
class Testimonial
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Ebook", inversedBy="testimonials")
     * @ORM\JoinColumn(nullable=false)
     */
    private $Ebook;

    /**
     * @ORM\Column(type="string", length=64)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=96, nullable=true)
     */
    private $image;

    /**
     * @ORM\Column(type="string", length=64, nullable=true)
     */
    private $jobPosition;

    /**
     * @ORM\Column(type="string", length=64, nullable=true)
     */
    private $company;

    /**
     * @ORM\Column(type="text")
     */
    private $comment;
    
    public function __toString() {
        return $this->getName();
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

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getJobPosition(): ?string
    {
        return $this->jobPosition;
    }

    public function setJobPosition(?string $jobPosition): self
    {
        $this->jobPosition = $jobPosition;

        return $this;
    }

    public function getCompany(): ?string
    {
        return $this->company;
    }

    public function setCompany(?string $company): self
    {
        $this->company = $company;

        return $this;
    }

    public function getComment(): ?string
    {
        return $this->comment;
    }

    public function setComment(string $comment): self
    {
        $this->comment = $comment;

        return $this;
    }
}
