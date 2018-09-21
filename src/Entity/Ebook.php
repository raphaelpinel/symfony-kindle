<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EbookRepository")
 */
class Ebook
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=96)
     */
    private $title;

    /**
     * @ORM\Column(type="string", length=96)
     */
    private $image;

    /**
     * @ORM\Column(type="text")
     */
    private $overview;

    /**
     * @ORM\Column(type="integer")
     */
    private $pagesTotal;

    /**
     * @ORM\Column(type="integer")
     */
    private $activeReaders;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $awards;

    /**
     * @ORM\Column(type="datetime")
     */
    private $displayDate;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\File", mappedBy="Ebook", orphanRemoval=true)
     */
    private $files;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Chapter", mappedBy="Ebook", orphanRemoval=true)
     */
    private $chapters;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Author", inversedBy="Ebook")
     * @ORM\JoinColumn(nullable=false)
     */
    private $author;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Testimonial", mappedBy="Ebook", orphanRemoval=true)
     */
    private $testimonials;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Download", mappedBy="Ebook", orphanRemoval=true)
     */
    private $downloads;

    public function __construct()
    {
        $this->files = new ArrayCollection();
        $this->chapters = new ArrayCollection();
        $this->testimonials = new ArrayCollection();
        $this->downloads = new ArrayCollection();
    }
    public function __toString() {
        return $this->getImage();
    }

    public function getId()
    {
        return $this->id;
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

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getOverview(): ?string
    {
        return $this->overview;
    }

    public function setOverview(string $overview): self
    {
        $this->overview = $overview;

        return $this;
    }

    public function getPagesTotal(): ?int
    {
        return $this->pagesTotal;
    }

    public function setPagesTotal(int $pagesTotal): self
    {
        $this->pagesTotal = $pagesTotal;

        return $this;
    }

    public function getActiveReaders(): ?int
    {
        return $this->activeReaders;
    }

    public function setActiveReaders(int $activeReaders): self
    {
        $this->activeReaders = $activeReaders;

        return $this;
    }

    public function getAwards(): ?int
    {
        return $this->awards;
    }

    public function setAwards(int $awards=null): self
    {
        $this->awards = $awards;

        return $this;
    }

    public function getDisplayDate(): ?\DateTimeInterface
    {
        return $this->displayDate;
    }

    public function setDisplayDate(\DateTimeInterface $displayDate): self
    {
        $this->displayDate = $displayDate;

        return $this;
    }

    /**
     * @return Collection|File[]
     */
    public function getFiles(): Collection
    {
        return $this->files;
    }

    public function addFile(File $file): self
    {
        if (!$this->files->contains($file)) {
            $this->files[] = $file;
            $file->setEbook($this);
        }

        return $this;
    }

    public function removeFile(File $file): self
    {
        if ($this->files->contains($file)) {
            $this->files->removeElement($file);
            // set the owning side to null (unless already changed)
            if ($file->getEbook() === $this) {
                $file->setEbook(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Chapter[]
     */
    public function getChapters(): Collection
    {
        return $this->chapters;
    }

    public function addChapter(Chapter $chapter): self
    {
        if (!$this->chapters->contains($chapter)) {
            $this->chapters[] = $chapter;
            $chapter->setEbook($this);
        }

        return $this;
    }

    public function removeChapter(Chapter $chapter): self
    {
        if ($this->chapters->contains($chapter)) {
            $this->chapters->removeElement($chapter);
            // set the owning side to null (unless already changed)
            if ($chapter->getEbook() === $this) {
                $chapter->setEbook(null);
            }
        }

        return $this;
    }

    public function getAuthor(): ?Author
    {
        return $this->author;
    }

    public function setAuthor(?Author $author): self
    {
        $this->author = $author;

        return $this;
    }

    /**
     * @return Collection|Testimonial[]
     */
    public function getTestimonials(): Collection
    {
        return $this->testimonials;
    }

    public function addTestimonial(Testimonial $testimonial): self
    {
        if (!$this->testimonials->contains($testimonial)) {
            $this->testimonials[] = $testimonial;
            $testimonial->setEbook($this);
        }

        return $this;
    }

    public function removeTestimonial(Testimonial $testimonial): self
    {
        if ($this->testimonials->contains($testimonial)) {
            $this->testimonials->removeElement($testimonial);
            // set the owning side to null (unless already changed)
            if ($testimonial->getEbook() === $this) {
                $testimonial->setEbook(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Download[]
     */
    public function getDownloads(): Collection
    {
        return $this->downloads;
    }

    public function addDownload(Download $download): self
    {
        if (!$this->downloads->contains($download)) {
            $this->downloads[] = $download;
            $download->setEbook($this);
        }

        return $this;
    }

    public function removeDownload(Download $download): self
    {
        if ($this->downloads->contains($download)) {
            $this->downloads->removeElement($download);
            // set the owning side to null (unless already changed)
            if ($download->getEbook() === $this) {
                $download->setEbook(null);
            }
        }

        return $this;
    }
}
