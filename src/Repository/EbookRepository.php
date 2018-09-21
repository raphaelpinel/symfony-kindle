<?php

namespace App\Repository;

use App\Entity\Ebook;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Ebook|null find($id, $lockMode = null, $lockVersion = null)
 * @method Ebook|null findOneBy(array $criteria, array $orderBy = null)
 * @method Ebook[]    findAll()
 * @method Ebook[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EbookRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Ebook::class);
    }

//    /**
//     * @return Ebook[] Returns an array of Ebook objects
//     */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('e.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    // search for a book corresponding to today's date    
    public function findEbookByDisplayDate($datenow): ?Ebook
    {
        return $this->createQueryBuilder('ebook') // searches the Ebook table // recherche dans la table Ebook
            ->andWhere('ebook.displayDate = :datenow') // where the programmed date is today's date // où la date programmée est la date du jour
            ->setParameter('datenow', $datenow) // sets the parameter // attribue le paramètre
            ->getQuery() // executes the search // effectue la recherche
            ->getOneOrNullResult() // give one result or null // donne un seul résultat ou null
        ;
    }
        // search for a book by id    
        public function findEbookById($id): ?Ebook
        {
            return $this->createQueryBuilder('ebook') // searches the Ebook table // recherche dans la table Ebook
                ->andWhere('ebook.id = :id') // with the desired id
                ->setParameter('id', $id) // sets the parameter // attribue le paramètre
                ->getQuery() // executes the search // effectue la recherche
                ->getOneOrNullResult() // donne un seul résultat ou null
            ;
        }

}
