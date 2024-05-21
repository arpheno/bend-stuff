def map(fn,list):
  fold list:
    case List/Cons:
      return List/Cons(fn(list.head), list.tail)
    case List/Nil:
      return List/Nil
def map2(fn,list1,list2):
  match list1:
    case List/Nil:
      return []
    case List/Cons:
      match list2:
        case List/Nil:
          return []
        case List/Cons:
          return List/Cons(fn(list1.head,list2.head), map2(fn,list1.tail,list2.tail))
def add(a,b):
  return a+b
def mul(a,b):
  return a*b
def sum(l):
  fold l:
    case List/Cons:
      return l.head+ l.tail
    case List/Nil:
      return 0
zip (List/Cons h1 t1) (List/Cons h2 t2) = (List/Cons (h1, h2) (zip t1 t2))
zip List/Nil * = List/Nil
zip * List/Nil = List/Nil
def dot(list1,list2):
  return sum(map2(mul,list1,list2))
def head(l):
  match l:
    case List/Cons:
      return l.head
    case List/Nil:
      return []
def tail(l):
  match l:
    case List/Cons:
      return l.tail
    case List/Nil:
      return []
def append(l1,l2):
  fold l1:
    case List/Cons:
      return l1
    case List/Nil:
      return l2
def transpose(M):
  match M:
    case List/Cons:
      first_column = map(head,M)
      remaining_matrix = map(tail,M)
      match remaining_matrix:
        case List/Cons:
          match remaining_matrix.head:
            case List/Cons:
              return [first_column,transpose(remaining_matrix)]
            case List/Nil:
              return first_column
        case List/Nil:
          return []
    case List/Nil:
      return []
def _matrix_mul(M,N):
  match M:
    case List/Cons:
      match M.tail:
        case List/Cons:
          return [line_mult(M.head,N),_matrix_mul(M.tail,N)]
        case List/Nil:
          return line_mult(M.head,N)

    case List/Nil:
      return []

  #return [line_mult(m,N) for m in M]
def line_mult(m,N):
  match N:
    case List/Cons:
      match N.tail:
        case List/Cons:
          return [dot(m,N.head),line_mult(m,N.tail)]
        case List/Nil:
          return dot(m,N.head)
    case List/Nil:
      return []
def matrix_mul(M,N):
  T=transpose(N)
  return _matrix_mul(M,T)
def matrix_add(M, N):
  return map2(map2(add), M, N) 

def main():
  stacked=[
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10]

]
  stacked2=[
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10],
[1,2,3,4,5,6,7,8,9,10]

]
  bend idx = 0:
    when idx < 10000:
      sum = matrix_mul(stacked,stacked2) + fork(idx+1)
    else:
      sum = stacked
  return sum
