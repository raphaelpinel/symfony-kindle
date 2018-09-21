<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\AuthorRepository")
 */
class Author
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Ebook", mappedBy="author", orphanRemoval=true)
     */
    private $Ebook;

    /**
     * @ORM\Column(type="string", length=96)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=96)
     */
    private $image;

    /**
     * @ORM\Column(type="text")
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=96, nullable=true)
     */
    private $signature;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Social", mappedBy="Author", orphanRemoval=true)
     */
    private $socials;

    public function __construct()
    {
        $this->Ebook = new ArrayCollection();
        $this->socials = new ArrayCollection();
    }
    public function __toString(){
        return (string) $this->getName();
    }

    public function getId()
    {
        return $this->id;
    }

    /**
     * @return Collection|Ebook[]
     */
    public function getEbook(): Collection
    {
        return $this->Ebook;
    }

    public function addEbook(Ebook $ebook): self
    {
        if (!$this->Ebook->contains($ebook)) {
            $this->Ebook[] = $ebook;
            $ebook->setName($this);
        }

        return $this;
    }

    public function removeEbook(Ebook $ebook): self
    {
        if ($this->Ebook->contains($ebook)) {
            $this->Ebook->removeElement($ebook);
            // set the owning side to null (unless already changed)
            if ($ebook->getName() === $this) {
                $ebook->setName(null);
            }
        }

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

    public function setImage(string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getSignature(): ?string
    {
        return $this->signature;
    }

    public function setSignature(?string $signature): self
    {
        $this->signature = $signature;

        return $this;
    }

    /**
     * @return Collection|Social[]
     */
    public function getSocials(): Collection
    {
        return $this->socials;
    }

    public function addSocial(Social $social): self
    {
        if (!$this->socials->contains($social)) {
            $this->socials[] = $social;
            $social->setAuthor($this);
        }

        return $this;
    }

    public function removeSocial(Social $social): self
    {
        if ($this->socials->contains($social)) {
            $this->socials->removeElement($social);
            // set the owning side to null (unless already changed)
            if ($social->getAuthor() === $this) {
                $social->setAuthor(null);
            }
        }

        return $this;
    }
}
